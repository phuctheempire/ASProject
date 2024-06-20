export default defineEventHandler(async (event) => {
    const body = await readBody(event)

    await event.context.prisma.plan.update({
        where: { id: body.id },
        data:{
            date: body.date,
            time: body.time,
            lieu: body.lieu,
        },
    })
    return { message: "User updated" }
})