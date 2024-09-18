# Stage 1: Build stage
FROM postman/newman:5.3-alpine AS builder

# Update/upgrade packages, install node module, extra packages, and clean up cache
RUN apk update && \
    apk upgrade && \
    apk add --no-cache curl zip iputils && \ 
    npm install -g newman-reporter-csvallinone && \
    npm cache clean --force && \
    rm -rf /var/cache/apk/*

# Stage 2: Final stage
FROM postman/newman:5.3-alpine

# Copy node modules from builder stage
COPY --from=builder /usr/local/lib/node_modules /usr/local/lib/node_modules

# Copy custom resolv.conf to the image
COPY resolv.conf /etc/resolv.conf

# Set environment variable NODE_PATH
ENV NODE_PATH=/usr/local/lib/node_modules

# Set the working directory
WORKDIR /etc/newman

# Set the entry point to newman
ENTRYPOINT ["newman"]