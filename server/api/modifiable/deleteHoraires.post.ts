export default defineEventHandler(async (event) => {
    const body = await readBody(event)

    await event.context.prisma.plan.delete({
        where: { id: body.id },
    })
    return { message: "User updated" }
})