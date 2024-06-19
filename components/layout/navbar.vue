<template>
  <div :class="`sidebar ${isSidebarOpen ? 'sidebar-expanded' : ''} text-white`" :style="{ backgroundColor: '#040c1c' }">

    <!-- Bouton pour fermer le sidebar -->
    <button @click="toggleSidebar" class="close-sidebar" aria-label="Close sidebar">
      <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor"
        class="h-6 w-6">
        <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" />
      </svg>
    </button>

    <button v-if="!isSidebarOpen" @click="toggleSidebar" class="focus:outline-none button-shift-left">
      <svg class="h-6 w-6 fill-current" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
        <path d="M0 3h20v2H0V3zm0 5h20v2H0V8zm0 5h20v2H0v-2z" />
      </svg>
    </button>
    <div class="logo text-center">
      <img v-if="isSidebarOpen" src="/public/img/logoAS.png" alt="Full Logo" class="h-12 mx-auto">
    </div>
    <div class="links">
      <NuxtLink to="/" class="sidebar-link">Football</NuxtLink>
      <NuxtLink to="/student-life" class="sidebar-link">Basketball</NuxtLink>
    </div>
  </div>

  <!-- ---------------------------------------- -->

  <!-- Navbar ------------------------- -->
  <nav class="border-purple-200 bg-purple-50 dark:bg-purple-900">
    <div class="max-w-screen-xl flex flex-wrap items-center justify-between mx-auto p-4">
      <!-- <Logo /> -->
      <!-- <button
  data-collapse-toggle="navbar-default"
  type="button"
  class="inline-flex items-center p-2 ml-3 text-sm text-purple-500 rounded-lg md:hidden hover:bg-purple-100 focus:outline-none focus:ring-2 focus:ring-purple-200 dark:text-purple-400 dark:hover:bg-purple-700 dark:focus:ring-purple-600"
  aria-controls="navbar-default"
  aria-expanded="false"
  >
  <span class="sr-only">Open main menu</span>
  <svg
  class="w-6 h-6"
  aria-hidden="true"
  fill="currentColor"
  viewBox="0 0 20 20"
  xmlns="http://www.w3.org/2000/svg"
  >
  <path
  fill-rule="evenodd"
  d="M3 5a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 10a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 15a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z"
  clip-rule="evenodd"
  ></path>
  </svg>
  </button> -->
      <div class="hidden w-full md:block md:w-auto ml-auto" id="navbar-default">
        <ul
          class="font-medium flex items-center border-purple-100 md:flex-row md:space-x-8 md:mt-0 md:border-0 dark:border-purple-700">
          <li>
            <NuxtLink to="/"
              class="block py-2 pl-3 pr-4 md:bg-transparent md:hover:text-purple-700 md:p-0 dark:text-white md:dark:text-purple-500"
              aria-current="page">Home
            </NuxtLink>
          </li>
          <li>
            <NuxtLink to="/login/protected"
              class="block py-2 pl-3 pr-4 md:bg-transparent md:hover:text-purple-700 md:p-0 dark:text-white md:dark:text-purple-500"
              aria-current="page">
              Protected
            </NuxtLink>
          </li>

          <li>
            <button v-if="loggedIn"
              class="block py-2 pl-3 pr-4 md:bg-transparent md:hover:text-purple-700 md:p-0 dark:text-white md:dark:text-purple-500"
              @click="signOut()">
              Sign out
            </button>
            <button v-else
              class="block py-2 pl-3 pr-4 md:bg-transparent md:hover:text-purple-700 md:p-0 dark:text-white md:dark:text-purple-500"
              @click="signIn()">
              Sign In
            </button>
          </li>
        </ul>
      </div>
    </div>
  </nav>
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
      this.$emit('toggle', this.isSidebarOpen);
    }
  }
}
</script>

<script setup>
const { status, signOut, signIn } = useAuth()

const loggedIn = computed(() => status.value === 'authenticated')

const datasport = await useFetch('/api/content/sport')
const sport = datasport.data
</script>

<style scoped>
.button-shift-left {
  position: fixed;
  left: 10px;
  top: 10px;
  transform: none;
  transition: transform 0.3s ease;
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
  transition: opacity 0.3s ease, background-color 0.3s ease;
  color: white;
}

.sidebar-link:hover {
  background-color: rgba(255, 255, 255, 0.1);
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