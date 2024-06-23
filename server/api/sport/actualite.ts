import { PrismaClient } from '@prisma/client'

const prisma = new PrismaClient()

export default eventHandler( async event => {

    // const body = await readBody(event)
    // const runtimeConfig = useRuntimeConfig()
    const actu = await event.context.prisma.article.findMany({
        include:{
            category:{
                select:
                {
                    name: true,
                }
            }
        }
    })
    console.log(actu)
    return actu

})