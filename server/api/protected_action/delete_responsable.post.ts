import { getServerSession } from '#auth'

export default defineEventHandler(async (event) => {
    const body = await readBody(event)
    
    const session = await getServerSession(event)
    if (!session) {
        // console.log("Failed")
        return { status:"failed", message: "No session" }
    }
    else{
        if ( session?.user?.role !== 'president'){
            // console.log("Failed")
            return { status:"failed", message: "Not president" }}
        else{
            await event.context.prisma.users.delete({
                where: { id: body.id },
            })
        }
        
    }
})