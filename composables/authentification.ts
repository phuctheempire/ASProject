// auth.ts
import {ISession} from '~/types/ISession';

export async function registerUser( name:string, username:string, email:string, password:string ) {
  
    try {
        const response = await $fetch<ISession>('/api/auth/register', {
            method: 'POST',
            body:{ name, username, email, password },
            })
        if (response) {
            useState('user').value = response
            await useRouter().push('/dashboard')
        }
    } catch (e) {
        console.error('error:' + e.tostring())
    }
}
