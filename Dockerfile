FROM ghcr.io/puppeteer/puppeteer:22.0.0

USER root

ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true \
    PUPPETEER_EXECUTABLE_PATH=/usr/bin/google-chrome-stable \
    NODE_ENV=development

WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN chown -R pptruser:pptruser /app
USER pptruser
EXPOSE 3000
CMD ["node", "src/server.js"]
