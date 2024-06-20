export default defineEventHandler(async (event) => {
    const body = await readBody(event)

    await event.context.prisma.article.update({
        where: { id: body.id },
        data:{
            title: body.title,
            description: body.description,
            image: body.image,
        },
    })
    return { message: "User updated" }
})