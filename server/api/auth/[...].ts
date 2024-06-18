// file: ~/server/api/auth/[...].ts
import { NuxtAuthHandler } from '#auth'
import GithubProvider from 'next-auth/providers/github'
import CredentialsProvider from 'next-auth/providers/credentials'
import { PrismaAdapter } from '@next-auth/prisma-adapter'
import { PrismaClient } from '@prisma/client'
// import { compare } from 'bcrypt'
// import { users } from '~~/db'


const runtimeConfig = useRuntimeConfig()
const prisma = new PrismaClient()

// async function getMe(session: any){
//   return await $fetch('/api/me',{
//     method: 'POST',
//     query: {
//       API_ROUTE_SECRET: runtimeConfig.API_ROUTE_SECRET,
//     },
//     body: {
//       email: session?.user?.email,
//     },
//   })
// }


export default NuxtAuthHandler({
  pages:{
    signIn: '/login', 
  },

  // adapter: PrismaAdapter(prisma),

  // callbacks: {
  //   session: async({session, token}) => {
  //     // console.log(user)
  //     // const isSignIn = user ? true : false
  //     // if (isSignIn){
  //     const me = await getMe(session)
  //     console.log(session)
  //     // ;(session as any).role = me?.role
  //     ;(session as any).subscribed = me?.subscribed
  //     return Promise.resolve(session),

  //   },

  // },
  providers: [
    // @ts-expect-error You need to use .default here for it to work during SSR. May be fixed via Vite at some point
    // GithubProvider.default({
    //   clientId: 'Ov23livBZibh4NhBpWLb',
    //   clientSecret: '7933c4a41d176057c1cf12b73584bf41f12f4595',
    // }),
    CredentialsProvider.default({
      name: 'Credentials',
      async authorize(credentials: any){
        // 
        const user = await prisma.users.findUnique({
          where: {username: credentials.username }
        })

        if(!user) {
          throw createError({
            statusCode: 403,
            statusMessage: "Credentials wrong",
          })
          return null

        }

        const isPasswordValid = (user.password === credentials.password)

        if (!isPasswordValid) {
          throw createError({
            statusCode: 403,
            statusMessage: "Wrong password",
          })
          return null
        }
        console.log(credentials)

        return user


      }
      
    })
  ],
})