import { PrismaClient } from '@prisma/client'
import { getServerSession } from '#auth'

const prisma = new PrismaClient()

export default eventHandler( async event => {

    // const body = await readBody(event)
    // const runtimeConfig = useRuntimeConfig()
    const users = await event.context.prisma.users.findMany()
    // return users

    const session = await getServerSession(event)
    // console.log(session)
    if (!session) {
      return null
    }
    return users
    })