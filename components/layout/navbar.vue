<template>
  <nav :class="isDarkMode ? 'bg-gray-800' : 'bg-purple-600'" class="shadow-md transition duration-300">
    <div class="container mx-auto px-4 py-2 flex justify-between items-center">
      <div class="flex items-center space-x-4">
        <NuxtLink to="/" class="text-2xl font-semibold" :class="isDarkMode ? 'text-white' : 'text-white'">
          <!-- <img src="/path-to-logo.png" alt="Logo" class="h-8 w-auto"> -->
        </NuxtLink>
      </div>
      <div class="hidden lg:flex items-center space-x-6">
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
      </div>
    </div>
  </nav>
</template>

<script>
export default {
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
    toggleMenu() {
      this.isMenuOpen = !this.isMenuOpen;
    },
  },
};
</script>

<style scoped>
/* Additional custom styles if needed */
</style>
