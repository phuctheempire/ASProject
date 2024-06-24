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
            await event.context.prisma.users.create({
                data:{
                    username: body.username,
                    password: body.password,
                    role: 'responsable',
                    sport_id: body.sport_id,
                    name: body.name,
                    email: body.email,
                    image: body.image,
                }
            })
        }
        
    }
})