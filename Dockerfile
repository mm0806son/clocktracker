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

ENV HOST 0.0.0.0
ENV PORT 8080

# Source: https://nuxt.com/docs/getting-started/deployment#entry-point
CMD ["node", "--max-old-space-size=1024", ".output/server/index.mjs"]
