export default defineEventHandler(async (event) => {
    const body = await readBody(event)

    await event.context.prisma.evenement.update({
        where: { id: body.id },
        data:{
            title: body.title,
            plan: body.plan,
        },
    })
    return { message: "User updated" }
})