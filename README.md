INSTALLATION
Premierement, dans le repectoire root, on installe le projet en utilisant le script:

npm run dev

AJOUT DE L'ENVIRONNEMENT:

On creer le fichier .env dans le repertoire racine. Dedans, on met:

DATABASE_URL="file:./dev.db"
AUTH_ORIGIN="http://localhost:3000"

Apres l'installation, on travail sur le bdd

INTEGRATION DE BASE DE DONNEE

On utilise prisma - sqlite. Il existe deja le bdd dans le projet. On l'integre:

npm run prisma:migrate:dev
npm run prisma:migrate:generate

CONSULTATION DE BASE DE DONNEE:

npm run prisma:studio

LANCEMENT DU PROJET SUR LOCALHOST:

npm run dev
