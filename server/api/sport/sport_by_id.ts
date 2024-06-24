import { PrismaClient } from '@prisma/client'

const prisma = new PrismaClient()

export default eventHandler( async event => {

    const query = await getQuery(event)
    // console.log(query)
    // const runtimeConfig = useRuntimeConfig()
    const sport = await event.context.prisma.sport.findMany({
        include: {
            article:true,
            evenement:true,
            plan:true,
        },
        where:{
            id: parseInt(query.id)
        }

})
// console.log(sport)
    return sport

})