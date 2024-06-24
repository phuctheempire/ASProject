import { getServerSession } from '#auth'

export default defineEventHandler(async event => {
    const session = await getServerSession(event)
    if (!session) {
        // console.log("Failed")
        return null
    }
    else{
        console.log(session?.user?.id)
        const user = await event.context.prisma.users.findUnique({
            where: { id: session?.user?.id },
            select: { id: true, username: true, email: true, name: true, image: true },
        })
        console.log(user)
        return user
    }

})