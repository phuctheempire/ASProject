<script setup>
    import Navbar from "~/components/layout/navbar.vue";
</script>
<template>
    <div class="h-screen">
        What's up
        <Navbar/>
        <slot/>
    </div>
</template>