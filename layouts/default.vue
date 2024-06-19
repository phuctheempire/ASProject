<script>
// import Sidebar from '/components/Navbar.vue'; 
export default {
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
<template>
    <div class="h-screen">
        <Navbar @toggle="handleSidebarToggle" />
        <div :class="`main-content ${isSidebarOpen ? 'shifted' : ''}`">
            <slot />
        </div>
    </div>
</template>

<style>
.main-content {
    transition: transform 0.3s ease;
    padding-top: 80px;
    padding-left: 20px;
    padding-right: 20px;
    /* Smooth transition for the transform */
}




.shifted {
    transform: translateX(256px);
    /* Adjust this value to match the width of your sidebar */
}
</style>