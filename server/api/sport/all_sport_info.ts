import { PrismaClient } from '@prisma/client'

const prisma = new PrismaClient()

export default eventHandler( async event => {

    const query = await getQuery(event)
    console.log("Query: " + query.sport_id)
    // const runtimeConfig = useRuntimeConfig()
    const sport = await event.context.prisma.sport.findMany({
        select: {
            id: true,
            name: true,
            city: true,
            user: {
                select:{
                    id: true,
                    name: true,
                    email: true,
                    image: true,          
                }
            },
            article:true,
            evenement:true,
            plan:true,
        },
        where:{
            id: parseInt(query.sport_id)
        }

    })
// console.log(sport)
    return sport

})