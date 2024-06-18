<template>
  <nav :class="isDarkMode ? 'bg-gray-800' : 'bg-purple-600'" class="shadow-md transition duration-300">
    <div class="test-container">
      <Sidebar />
    

      <div class="flex items-center space-x-4">
        <NuxtLink to="/" class="text-2xl font-semibold" :class="isDarkMode ? 'text-white' : 'text-white'">
          <!-- <img src="/path-to-logo.png" alt="Logo" class="h-8 w-auto"> -->
        </NuxtLink>
      </div>
      <div class="hidden lg:flex items-center space-x-6">
        <!-- Liens et autres éléments ici -->
      </div>
      <!-- Mobile menu toggle button -->
    </div>
    <!-- Menu conditionnel pour version mobile -->
  </nav>
</template>


<script>
import Sidebar from '/components/SideBar.vue' 
export default {
  components: {
    Sidebar 
  },
  data() {
    return {
      isDarkMode: false,
      isMenuOpen: false,
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
    
  },
};
</script>

<style scoped>
.test-container {
    position: relative;
    height: 100vh; 
  }
</style>
