<template>
    <div class="fixed inset-0 z-50 flex items-center justify-center bg-black bg-opacity-50">
      <div class="bg-white p-8 rounded-lg shadow-md max-w-md">
        <h2 class="text-xl font-semibold mb-4">Confirm Delete</h2>
        <p class="mb-4">{{ message }}</p>
        <div class="flex justify-end">
          <button @click="cancel" class="text-gray-500 hover:text-gray-700 mr-4">Cancel</button>
          <button @click="confirm" class="text-red-500 hover:text-red-700">Delete</button>
        </div>
      </div>
    </div>
  </template>
  
  <script setup>
  import { ref } from 'vue';
  
  const isVisible = ref(true);
  const message = ref('');
  
  const cancel = () => {
    isVisible.value = false;
  };
  
  const confirm = () => {
    isVisible.value = false;
    // Emit custom event to parent component
    emit('confirmed');
  };
  </script>
  
  <style scoped>
  /* Custom styles for the confirmation dialog */
  </style>
  