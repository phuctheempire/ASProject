<template>
    <div class="test-container">
      <Sidebar />
    </div>
  </template>
  
  <script>
  import Sidebar from '/components/SideBar.vue'; // Assurez-vous que le chemin est correct
  
  export default {
    components: {
      Sidebar
    }
  }
  </script>
  
  <style>
  .test-container {
    position: relative;
    height: 100vh; 
  }
  </style>  