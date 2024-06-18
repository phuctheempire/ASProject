<template>
  <div class="flex">
    <!-- Sidebar -->
    <div :class="`sidebar ${isSidebarOpen ? 'sidebar-expanded' : ''} bg-purple-600 text-white`">
      <button @click="toggleSidebar" class="close-sidebar" aria-label="Close sidebar">
        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" class="h-6 w-6">
          <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" />
        </svg>
      </button>
      <div class="logo text-center">
        <img v-if="isSidebarOpen" src="/public/img/menu.png" alt="Full Logo" class="h-12 mx-auto">
      </div>
      <div class="links">
        <NuxtLink to="/" class="sidebar-link">Football</NuxtLink>
        <NuxtLink to="/student-life" class="sidebar-link">Basketball</NuxtLink>
      </div>
    </div>
    <div class="flex-1">
      <nav :class="isDarkMode ? 'bg-gray-800' : 'bg-purple-600'" class="shadow-md transition duration-300">
    <div class="container mx-auto px-4 py-2 flex justify-between items-center">
      <div class="flex items-center space-x-4">
        <NuxtLink to="/" class="text-2xl font-semibold" :class="isDarkMode ? 'text-white' : 'text-white'">
          <!-- <img src="/path-to-logo.png" alt="Logo" class="h-8 w-auto"> -->
        </NuxtLink>
      </div>
      <div class="hidden lg:flex items-center space-x-6">
        <button @click="toggleSidebar" class="focus:outline-none button-shift-left">
          <svg class="h-6 w-6 fill-current" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
            <path d="M0 3h20v2H0V3zm0 5h20v2H0V8zm0 5h20v2H0v-2z"/>
          </svg>
        </button>
        <NuxtLink to="/" :class="linkClass">Home</NuxtLink>
        <NuxtLink to="/about" :class="linkClass">About</NuxtLink>
        <NuxtLink to="/services" :class="linkClass">Services</NuxtLink>
        <NuxtLink to="/contact" :class="linkClass">Contact</NuxtLink>
        <NuxtLink to="/get-started" :class="buttonClass">Get Started</NuxtLink>
        <!-- <NuxtLink to="/login" :class="buttonClass">Login</NuxtLink>
        <NuxtLink to="/register" :class="buttonClass">Register</NuxtLink> -->
        <button @click="toggleDarkMode" class="ml-4 px-4 py-2 rounded focus:outline-none" :class="toggleButtonClass">
          {{ isDarkMode ? 'Light Mode' : 'Dark Mode' }}
        </button>
      </div>
      <div class="lg:hidden flex items-center">
        <button @click="toggleMenu" :class="isDarkMode ? 'text-white' : 'text-white'" class="focus:outline-none">
          <svg class="h-6 w-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16m-7 6h7"></path>
          </svg>
        </button>
      </div>
    </div>
    <div v-if="isMenuOpen" class="lg:hidden">
      <div class="px-2 pt-2 pb-3 space-y-1 sm:px-3">
        <NuxtLink to="/" :class="linkClassMobile">Home</NuxtLink>
        <NuxtLink to="/about" :class="linkClassMobile">About</NuxtLink>
        <NuxtLink to="/services" :class="linkClassMobile">Services</NuxtLink>
        <NuxtLink to="/contact" :class="linkClassMobile">Contact</NuxtLink>
        <NuxtLink to="/get-started" :class="buttonClassMobile">Get Started</NuxtLink>
        <!-- <NuxtLink to="/login" :class="buttonClassMobile">Login</NuxtLink>
        <NuxtLink to="/register" :class="buttonClassMobile">Register</NuxtLink> -->
        <button @click="toggleDarkMode" class="block w-full text-center px-4 py-2 rounded focus:outline-none" :class="toggleButtonClassMobile">
          {{ isDarkMode ? 'Light Mode' : 'Dark Mode' }}
        </button>
        <button @click="toggleSidebar" class="focus:outline-none button-shift-left">
          <svg class="h-6 w-6 fill-current" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
            <path d="M0 3h20v2H0V3zm0 5h20v2H0V8zm0 5h20v2H0v-2z"/>
          </svg>
        </button>
        
      </div>
    </div>
  </nav>

  </div>
  </div>
  
</template>

<script>
export default {
  data() {
    return {
      isDarkMode: false,
      isMenuOpen: false,
      isSidebarOpen: false,
    };
  },
  computed: {
    linkClass() {
      return this.isDarkMode
        ? 'text-white hover:text-gray-300 transition duration-300'
        : 'text-white hover:text-gray-200 transition duration-300';
    },
    linkClassMobile() {
      return this.isDarkMode
        ? 'block text-white hover:text-gray-300 transition duration-300'
        : 'block text-white hover:text-gray-200 transition duration-300';
    },
    buttonClass() {
      return this.isDarkMode
        ? 'bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600 transition duration-300'
        : 'bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600 transition duration-300';
    },
    buttonClassMobile() {
      return this.isDarkMode
        ? 'block bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600 transition duration-300'
        : 'block bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600 transition duration-300';
    },
    toggleButtonClass() {
      return this.isDarkMode
        ? 'bg-white text-gray-800 px-4 py-2 rounded hover:bg-gray-300 transition duration-300'
        : 'bg-gray-800 text-white px-4 py-2 rounded hover:bg-gray-900 transition duration-300';
    },
    toggleButtonClassMobile() {
      return this.isDarkMode
        ? 'block bg-white text-gray-800 w-full text-center px-4 py-2 rounded hover:bg-gray-300 transition duration-300'
        : 'block bg-gray-800 text-white w-full text-center px-4 py-2 rounded hover:bg-gray-900 transition duration-300';
    },
  },
  methods: {
    toggleDarkMode() {
      this.isDarkMode = !this.isDarkMode;
    },
    toggleMenu() {
      this.isMenuOpen = !this.isMenuOpen;
    },
    toggleSidebar() {
      this.isSidebarOpen = !this.isSidebarOpen;
    }
  },
};
</script>

<style scoped>
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

.button-shift-left {
  position: fixed; /* Fixez le bouton en haut à gauche */
  left: 10px; /* Décalez de 10px du bord gauche */
  top: 10px; /* Ajustez en haut */
  transform: none; /* Supprimez tout déplacement */
  transition: transform 0.3s ease; /* Gardez une transition douce si vous souhaitez ajouter un effet */
 
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

.logo {
  padding: 10px 0;
}

.close-sidebar {
  position: absolute;
  top: 10px; /* Ajustez la position en haut à droite */
  right: 10px;
  background: transparent;
  border: none;
  color: white; /* La couleur peut varier selon votre palette de couleurs */
  cursor: pointer;
  z-index: 1050; /* Assurez-vous qu'il est au-dessus de tout contenu dans la sidebar */
}

.close-sidebar svg {
  fill: white; /* Couleur de l'icône de fermeture */
}
</style>