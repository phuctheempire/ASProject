<script setup lang="ts">

definePageMeta({auth: false})

const headers = useRequestHeaders(['cookie']) as HeadersInit
const { data: token } = await useFetch('/api/token', { headers })
</script>

<template>
    <div>
        <pre>{{ token || 'No token present' }}</pre>
    </div>

</template>