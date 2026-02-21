# stage 1 - Builder
FROM nginx:alpine AS builder
WORKDIR /app
COPY index.html .

# stage 2 - Runtime
FROM nginx:alpine
COPY --from=builder /app/index.html /usr/share/nginx/html/index.html


