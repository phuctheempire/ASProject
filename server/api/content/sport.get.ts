import { PrismaClient } from '@prisma/client'

const prisma = new PrismaClient()

export default eventHandler( async event => {

    // const body = await readBody(event)
    // const runtimeConfig = useRuntimeConfig()
    const sport = await prisma.sport.findMany()
    return sport

})