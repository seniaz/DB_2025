-- CreateTable
CREATE TABLE "readinglist" (
    "readinglistid" SERIAL NOT NULL,
    "userid" INTEGER NOT NULL,
    "bookid" INTEGER NOT NULL,
    "status" VARCHAR(20) NOT NULL,
    "addeddate" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "readinglist_pkey" PRIMARY KEY ("readinglistid")
);

-- CreateIndex
CREATE UNIQUE INDEX "readinglist_userid_bookid_key" ON "readinglist"("userid", "bookid");

-- AddForeignKey
ALTER TABLE "readinglist" ADD CONSTRAINT "readinglist_bookid_fkey" FOREIGN KEY ("bookid") REFERENCES "book"("bookid") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "readinglist" ADD CONSTRAINT "readinglist_userid_fkey" FOREIGN KEY ("userid") REFERENCES "users"("userid") ON DELETE CASCADE ON UPDATE CASCADE;
