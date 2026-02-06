# Source: https://nuxtjs.org/deployments/koyeb#dockerize-your-application
FROM node:lts as builder

WORKDIR /app

COPY . .

RUN npm install

ARG SUPABASE_URL
ARG SUPABASE_KEY
ARG BUGSNAG_API_KEY

RUN SUPABASE_URL=$SUPABASE_URL \
    SUPABASE_KEY=$SUPABASE_KEY \
    BUGSNAG_API_KEY=$BUGSNAG_API_KEY \
    npm run build

FROM node:lts

WORKDIR /app

COPY --from=builder /app .

COPY docker-entrypoint /usr/local/bin/docker-entrypoint
RUN chmod +x /usr/local/bin/docker-entrypoint

ENV HOST 0.0.0.0
ENV PORT 8080

# Source: https://nuxt.com/docs/getting-started/deployment#entry-point
ENTRYPOINT ["/usr/local/bin/docker-entrypoint"]
CMD ["node", ".output/server/index.mjs"]
