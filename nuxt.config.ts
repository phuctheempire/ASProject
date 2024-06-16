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

  modules: ["@nuxt/content"]
})