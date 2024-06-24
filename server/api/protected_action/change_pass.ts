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
            const current_pass = await event.context.prisma.users.findUnique({
                where: { id: parseInt(body.id) },
                select: { password: true },
            })
            if (body.old_password !== current_pass?.password){
                // console.log("Failed")
                return { status:"failed", message: "Old password is incorrect" }
            } else if ( body.new_password !== body.confirm_password){
                    return { status:"failed", message: "Password and confirmation do not match" }
            }else {
            await event.context.prisma.users.update({
                where: { id: parseInt(body.id) },
                data: {
                    password: body.new_password,
                },
            })
            // console.log(session.user)
            
            // console.log("Success")
            return { status:"success", message: "Password updated" }
        }
    }

}
})