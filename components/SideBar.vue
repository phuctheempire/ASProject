<template>
    <div :class="`sidebar ${isSidebarOpen ? 'sidebar-expanded' : ''} bg-blue-900 text-white`">
      <!-- Bouton pour fermer le sidebar -->
      <button @click="toggleSidebar" class="close-sidebar" aria-label="Close sidebar">
        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" class="h-6 w-6">
          <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" />
        </svg>
      </button>
      <!-- Bouton pour ouvrir le sidebar, caché quand le sidebar est ouvert -->
      <button v-if="!isSidebarOpen" @click="toggleSidebar" class="focus:outline-none button-shift-left">
        <svg class="h-6 w-6 fill-current" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
          <path d="M0 3h20v2H0V3zm0 5h20v2H0V8zm0 5h20v2H0v-2z"/>
        </svg>
      </button>
      <div class="logo text-center">
        <!-- <img v-if="isSidebarOpen" src="/public/img/icone.png" alt="Full Logo" class="h-12 mx-auto"> -->
      </div>
      <div class="links">
        <NuxtLink v-for="item in sport" :key="item.id" :to="`/sport/${item.name}`" class="sidebar-link custom-font">
          {{ item.name }}
        </NuxtLink>
      </div>
    </div>
  </template>
  <script>
  export default {
    data() {
      return {
        isSidebarOpen: false,
      };
    },
    methods: {
      toggleSidebar() {
        this.isSidebarOpen = !this.isSidebarOpen;
      }
    }
  }
  </script>

<script setup >
const datasport = await useFetch('/api/content/sport')
const sport = datasport.data
</script>

<style scoped>



.button-shift-left {
  position: fixed; /* Fixez le bouton en haut à gauche */
  left: 10px; /* Décalez de 10px du bord gauche */
  top: 10px; /* Ajustez en haut */
  transform: none; /* Supprimez tout déplacement */
  transition: transform 0.3s ease; /* Gardez une transition douce si vous souhaitez ajouter un effet */
 
}
    .sidebar {
      transition: width 0.3s, padding 0.3s;
      width: 0;
      padding: 0;
      position: fixed;
      left: 0;
      top: 0;
      height: 100vh;
      overflow-y: auto;
      z-index: 1000;
    }


    .sidebar-expanded {
      width: 256px;
      padding: 10px 15px;
    }
    .sidebar-link {
      display: block;
      padding: 10px 0;
      text-decoration: none;
      opacity: 0;
      transition: opacity 0.3s ease;
    }
    .sidebar-expanded .sidebar-link {
      opacity: 1;
    }
    .close-sidebar {
      position: absolute;
      top: 10px;
      right: 10px;
      background: transparent;
      border: none;
      color: white;
      cursor: pointer;
      z-index: 1050;
    }
    .close-sidebar svg {
      fill: white;
    }
  </style>
  