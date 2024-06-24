
import { getServerSession } from '#auth'

export default defineEventHandler(async (event) => {
    const body = await readBody(event)


    const session = await getServerSession(event)
    if (!session) {
        return { message: "You are not authorized to perform this action" }
    }
    else{    
        if ( session?.user?.role !== "president" && session?.user?.sport_id !== body.sport_id){
            return { message: "User not created" }
        } else {
            await event.context.prisma.article.delete({
                where: { id: body.id },
            })
    }}
})