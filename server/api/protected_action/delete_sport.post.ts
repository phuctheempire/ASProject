import { getServerSession } from '#auth'

export default defineEventHandler(async (event) => {
    const body = await readBody(event)
    console.log(body.sport_id)

    const session = await getServerSession(event)
    if (!session) {
        // console.log("Failed")
        return { status:"failed", message: "No session" }
    }
    else{
        if ( session?.user?.role !== 'president'){
            // console.log("Failed")
            return { status:"failed", message: "Not president" }
        } else {
            // const delpost = await event.context.prisma.plan.deleteMany({
            //     where:{ sportid: body.id},
            // })
            // const delarticle = await event.context.prisma.article.deleteMany({
            //     where: { categoryid: body.id },
            // })
            // const delevent = await event.context.prisma.evenement.deleteMany({
            //     where: { categoryid: body.id },
            // })
            // const deluser = await event.context.prisma.users.deleteMany({
            //     where: { sport_id: body.id },
            // })
            await event.context.prisma.sport.delete({
                where: { 
                    id: parseInt(body.sport_id), 
                },
            })
            // const transaction = await event.context.prisma.$transaction([delarticle, delevent, deluser, delsport, delpost])
            return { status:"success", message: "Sport deleted"}
        }
    }

})