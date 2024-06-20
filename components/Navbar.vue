<template>
  <!-- Navbar ------------------------- -->
  <nav class="py-2 border-purple-200 bg-purple-50 dark:bg-purple-900 fixed-nav">
    <div class="max-w-screen-xl flex flex-wrap items-center justify-between mx-auto p-4">
      <div class="hidden w-full md:block md:w-auto ml-auto" id="navbar-default">
        <ul v-if="!isMobile" class="font-medium flex items-center border-purple-100 md:flex-row md:space-x-8 md:mt-0 md:border-0 dark:border-purple-700">
          <li>
            <NuxtLink to="/" class="block pl-3 pr-4 md:bg-transparent md:hover:text-purple-700 md:p-0 dark:text-white md:dark:text-purple-500" aria-current="page">
              Home
            </NuxtLink>
          </li>
          <li>
            <NuxtLink to="/login/protected" class="block pl-3 pr-4 md:bg-transparent md:hover:text-purple-700 md:p-0 dark:text-white md:dark:text-purple-500" aria-current="page">
              Protected
            </NuxtLink>
          </li>
          <li>
            <button v-if="loggedIn" class="block pl-3 pr-4 md:bg-transparent md:hover:text-purple-700 md:p-0 dark:text-white md:dark:text-purple-500" @click="signOut()">
              Sign out
            </button>
            <button v-else class="block pl-3 pr-4 md:bg-transparent md:hover:text-purple-700 md:p-0 dark:text-white md:dark:text-purple-500" @click="signIn()">
              Sign In
            </button>
          </li>
        </ul>
      </div>
    </div>
  </nav>

  <div :class="`sidebar ${isSidebarOpen ? 'sidebar-expanded' : ''}`">
    <!-- Bouton pour fermer le sidebar -->
    <button @click="toggleSidebar" class="close-sidebar" aria-label="Close sidebar">
      <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" class="h-6 w-6">
        <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" />
      </svg>
    </button>

    <button v-if="!isSidebarOpen" @click="toggleSidebar" class="focus:outline-none button-shift-left">
      <svg class="h-8 w-10 md:h-10 md:w-10 fill-current" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
        <path d="M0 3h20v2H0V3zm0 5h20v2H0V8zm0 5h20v2H0v-2z" />
      </svg>
    </button>

    <div class="logo text-center">
      <img v-if="isSidebarOpen" src="/public/img/logoAS.png" alt="Full Logo" class="h-12 mx-auto">
    </div>

    <div class="links">
      <NuxtLink v-for="item in distinctNames" :to="`/sport/${item}`" class="sidebar-link">
        {{ item }}
      </NuxtLink>
    </div>

    <div class="links" v-if="isMobile">
      <NuxtLink to="/" class="sidebar-link">Home</NuxtLink>
      <NuxtLink to="/login/protected" class="sidebar-link">Protected</NuxtLink>
      <button v-if="loggedIn" class="sidebar-link" @click="signOut()">
        Sign out
      </button>
      <button v-else class="sidebar-link" @click="signIn()">
        Sign In
      </button>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      isSidebarOpen: false,
      isMobile: false
    };
  },
  methods: {
    toggleSidebar() {
      this.isSidebarOpen = !this.isSidebarOpen;
      this.$emit('toggle', this.isSidebarOpen);
    },
    checkWindowSize() {
      this.isMobile = window.innerWidth <= 768;
    }
  },
  mounted() {
    this.checkWindowSize();
    window.addEventListener('resize', this.checkWindowSize);
  },
  beforeDestroy() {
    window.removeEventListener('resize', this.checkWindowSize);
  }
}
</script>

<script setup>
const { status, signOut, signIn } = useAuth()

const loggedIn = computed(() => status.value === 'authenticated')

const sport = await useFetch('/api/content/sport')
const valsport = sport.data._value
// console.log(valsport)
const distinctNames = [...new Set(valsport.map(sport => sport.name))];

// console.log(distinctNames);
</script>

<style scoped>
.fixed-nav {
  position: fixed;
  top: 0;
  width: 100%;
  z-index: 1000;
}

.button-shift-left {
  position: fixed;
  left: 10px;
  top: 10px;
  transform: none;
  transition: transform 0.3s ease;
}

.sidebar {
  transition: width 0.5s ease, padding 0.5s ease;
  width: 0;
  padding: 0;
  position: fixed;
  left: 0;
  top: 0;
  height: 100vh;
  overflow-y: auto;
  z-index: 1000;
  background: linear-gradient(145deg, #3b82f6, #9333ea);
  box-shadow: 2px 0 12px rgba(0, 0, 0, 0.2);
}

.sidebar-expanded {
  width: 256px;
  padding: 20px;
}

.sidebar-link {
  display: block;
  padding: 10px 0;
  text-decoration: none;
  color: white;
  opacity: 0;
  transform: translateX(-20px);
  transition: opacity 0.3s ease, transform 0.3s ease, background-color 0.3s ease;
}

.sidebar-link:hover {
  background-color: rgba(255, 255, 255, 0.1);
  margin-left: 10px;
}

.sidebar-expanded .sidebar-link {
  opacity: 1;
  transform: translateX(0);
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

.md\\:button-shift-left-md {
  left: 20px;
  top: 20px;
}

@media (max-width: 768px) {
  .button-shift-left {
    left: 5px;
    top: 5px;
  }
}
</style>
