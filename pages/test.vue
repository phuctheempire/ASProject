<template>
  <div class="test-container">
    <Sidebar @toggle="handleSidebarToggle" />
    <div :class="`main-content ${isSidebarOpen ? 'shifted' : ''}`">
      <!-- Contenu principal de la page ici -->
      <!-- Par exemple -->
      <h1 class="welcome-message">Bienvenue sur le site de l'Association Sportive !</h1>
    </div>
  </div>
</template>

<script>
import Sidebar from '/components/SideBar.vue'; 

export default {
  components: {
    Sidebar
  },
  data() {
    return {
      isSidebarOpen: false,
    };
  },
  methods: {
    handleSidebarToggle(isOpen) {
      this.isSidebarOpen = isOpen;
    }
  }
}
</script>

<style>
.test-container {
  position: relative;
  height: 100vh;
  transition: margin-left 0.3s;
}

.main-content {
  transition: margin-left 0.3s;
  margin-left: 0;
}

.main-content.shifted {
  margin-left: 256px; 
}

.welcome-message {
  padding: 20px;
}
</style>
