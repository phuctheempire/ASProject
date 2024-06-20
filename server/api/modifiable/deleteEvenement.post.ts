export default defineEventHandler(async (event) => {
    const body = await readBody(event)

    await event.context.prisma.evenement.delete({
        where: { id: body.id },
    })
    return { message: "User updated" }
})