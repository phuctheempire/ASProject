// file: ~/server/api/auth/[...].ts
import { NuxtAuthHandler } from '#auth'
import GithubProvider from 'next-auth/providers/github'
import CredentialsProvider from 'next-auth/providers/credentials'
import { users } from '~~/db'

export default NuxtAuthHandler({
  pages:{
    signIn: '/login', 
  },
  callbacks: {
  jwt: async({token, user}) => {
    console.log(user)
    const isSignIn = user ? true : false
    if (isSignIn){
      const me = users.find( u => u.email === user.email)
      token.role = me?.role
    }
    return Promise.resolve(token)
  },
  session: async({session, token}) => {
    (session as any).role = token.role
    return Promise.resolve(session)
  },
  },

  providers: [
    // @ts-expect-error You need to use .default here for it to work during SSR. May be fixed via Vite at some point
    GithubProvider.default({
      clientId: 'Ov23livBZibh4NhBpWLb',
      clientSecret: '7933c4a41d176057c1cf12b73584bf41f12f4595',
    }),

    CredentialsProvider.default({
      name: 'Credentials',
      authorize(credentials: any){
        // 
        const user = {
          email: 'phuctheempire1@gmail.com',
          password: 'password'
        }
        console.log(credentials)
        if (credentials.email === user.email && credentials.password === user.password){
          return user
        }
      }
      
    })
  ],
})