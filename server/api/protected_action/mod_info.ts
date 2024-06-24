import { getServerSession } from '#auth'

export default defineEventHandler(async (event) => {
    const body = await readBody(event)
    // console.log(body)

    const session = await getServerSession(event)
    if (!session) {
        // console.log("Failed")
        return { status:"failed", message: "No session" }
    }
    else{
        if ( session?.user?.id !== body.id){
            // console.log("Failed")
            return { status:"failed", message: "User not created" }
        } else {
            await event.context.prisma.users.update({
                where: { id: parseInt(body.id) },
                data: {
                    username: body.username,
                    email: body.email,
                    name: body.name,
                    image: body.image,
                },
            })
        }
    }

})