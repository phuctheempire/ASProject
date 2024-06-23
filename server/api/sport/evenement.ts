import { PrismaClient } from '@prisma/client'

const prisma = new PrismaClient()

export default eventHandler( async event => {

    // const body = await readBody(event)
    // const runtimeConfig = useRuntimeConfig()
    const evenement = await event.context.prisma.evenement.findMany({
        include:{
            category:{
                select:
                {
                    name: true,
                }
            }
        }
    })
    console.log(evenement)
    return evenement

})