// https://nuxt.com/docs/api/configuration/nuxt-config
import { resolve } from 'path'
// import {defineNuxtConfig} from 'nuxt'
export default defineNuxtConfig({
  devtools: { enabled: true },
  css: ['~/assets/css/main.scss'],

  postcss: {
    plugins: {
      tailwindcss: {},
      autoprefixer: {},
    },
  },

  modules: ["@nuxt/content",
    // '@nuxtjs/axios',
    // '@nuxtjs/auth-next',
    '@sidebase/nuxt-auth',  
  ], 
  // auth: {
  //   globalAppMiddleware: true,
  // },
  runtimeConfig: {
    GITHUB_CLIENT_SECRET: process.env.GITHUB_CLIENT_SECRET,
    API_ROUTE_SECRET: process.env.API_ROUTE_SECRET,
    public: {
      GITHUB_CLIENT_ID: process.env.GITHUB_CLIENT_ID,
    },
  }
  // modules: ['@sidebase/nuxt-auth']
})

