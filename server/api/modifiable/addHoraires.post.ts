import { getServerSession } from '#auth'


export default defineEventHandler(async (event) => {
    const body = await readBody(event)
    console.log(body)


    const session = await getServerSession(event)
    if (!session) {
        return { message: "You are not authorized to perform this action" }
    }
    else{    
        if ( session?.user?.role !== "president" && session?.user?.sport_id !== body.sport_id){
            return { message: "User not created" }
        } else {
            await event.context.prisma.plan.create({
                data: {
                    date : body.date,
                    time: body.time,
                    lieu: body.lieu,
                    sportid: body.sport_id,
                },
            })
    }}
})