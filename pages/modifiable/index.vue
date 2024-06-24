<script setup>


definePageMeta({ middleware: 'verify' })

const { data } = useAuth()
const role = data._object['$sauth:data'].user.role
console.log(data._object['$sauth:data'].user)
if (role === 'responsable') {
  console.log('You are a responsable')
  navigateTo('/modifiable/respo')
} else if (role === 'president') {
  console.log('You are a president')
    navigateTo('/modifiable/president')
} else{
    console.log('/')
}


</script>

<template>
  <div>
    <h1>Modifiable Page</h1>
    <p>{{ data }}</p>
  </div>
</template>