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
    <div class="h-screen background-image">
        <Navbar @toggle="handleSidebarToggle" />
        <div :class="`main-content ${isSidebarOpen ? 'shifted' : ''}`">
            <slot />
        </div>
        
    </div>
    
</template>

<style scoped>
.page-container {
    position: relative;
    min-height: 100vh;
    display: flex;
    flex-direction: column;
    overflow: hidden; /* Prevents horizontal overflow */
}

.background-image {
    background-image: url('/public/img/background.jpg'); /* Update the path to your image */
    background-size: cover; /* Ensures the image covers the entire background */
    background-position: center; /* Centers the image */
    background-repeat: no-repeat; /* Prevents the image from repeating */
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    z-index: -1; /* Ensures the background is behind other elements */
}

.main-content {
    transition: transform 0.3s ease;
    padding-top: 80px;
    padding-left: 20px;
    padding-right: 20px;
    flex: 1; /* Ensures main-content takes available space */
    position: relative;
    z-index: 1; /* Ensures the content is above the background */
    overflow-y: auto; /* Allows vertical scrolling */
    height: 100vh; /* Ensures the content div takes the full viewport height */
}

.shifted {
    transform: translateX(256px);
    /* Adjust this value to match the width of your sidebar */
}
</style>