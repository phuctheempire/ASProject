export default defineNuxtRouteMiddleware((to, from) => {
    const {data, status} = useAuth()
    if (status.value != 'authenticated'){
        return navigateTo('/login');
    }

})