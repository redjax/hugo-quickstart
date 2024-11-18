ARG HUGO_SITE_DIR=./site
FROM golang:latest AS build

## Install Hugo from GitHub
RUN git clone https://github.com/gohugoio/hugo.git /hugo
WORKDIR /hugo
RUN go install --tags extended

FROM build AS stage
ARG HUGO_SITE_DIR

## Copy your Hugo site into the container
WORKDIR /site
COPY ${HUGO_SITE_DIR} .

## Build the Hugo site
RUN hugo --destination /public

FROM stage AS dev

WORKDIR /site
COPY --from=stage /site .

EXPOSE 1313

CMD ["hugo", "serve", "--bind", "0.0.0.0", "--port", "1313"]

FROM nginx:alpine AS serve

# Copy the built site from the Hugo builder stage to Nginx's HTML directory
COPY --from=stage /public /usr/share/nginx/html

# Expose the default Nginx port
EXPOSE 80

# Run Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
