<script setup lang="ts">
definePageMeta({
    auth:{
        unauthentiacatedOnly: true,
        navigateAuthenticatedTo: '/login/protected',
    },
})
</script>

<template>
    <h1>I'm for guess only</h1>
</template>