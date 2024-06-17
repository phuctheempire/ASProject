<template>
    <div>
        <NuxtLayout>
        <!-- <NuxtPage /> -->
        <h1>Data: {{ data }}</h1>
        </NuxtLayout>
    </div>
</template>

<script setup lang="ts">
    const {data} = await useFetch('/api/me')
</script>