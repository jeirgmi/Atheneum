export default function HomePage() {
  return (
    <main className="bg-[#eeefec] text-[#1a1a1a] min-h-screen font-sans">
      <section className="text-center py-16 border-b border-[#d0d0cc]">
        <h1 className="text-6xl font-bold mb-3 tracking-wide">𝕬𝖙𝖍𝖊𝖓𝖊𝖚𝖒</h1>
        <p className="text-lg text-[#8391a1]">Dust's knowledge repository</p>
      </section>

      <section className="max-w-5xl mx-auto py-12">
        <h2 className="text-2xl font-semibold mb-4 text-[#4a4a4a]">
          Popular Pages
        </h2>
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
          {[1, 2, 3].map((i) => (
            <div
              key={i}
              className="bg-white rounded-xl shadow-sm border border-[#dcdcd7] hover:shadow-md transition p-6"
            >
              <h3 className="text-xl font-semibold mb-2 text-[#2b2b2b]">
                Article Title {i}
              </h3>
              <p className="text-sm text-[#6b6b6b]">
                Short summary of what this page covers about Dust.
              </p>
            </div>
          ))}
        </div>
      </section>

      <section className="bg-[#f5f6f4] py-12 border-t border-[#d0d0cc]">
        <div className="max-w-4xl mx-auto">
          <h2 className="text-2xl font-semibold mb-6 text-[#4a4a4a]">
            Top Contributors
          </h2>
          <div className="space-y-3">
            {[{ name: "0xJeir", edits: 32 }, { name: "0xMira", edits: 24 }, { name: "0xNova", edits: 18 }].map(
              (user, i) => (
                <div
                  key={i}
                  className="flex justify-between bg-white border border-[#dcdcd7] rounded-lg px-6 py-3 shadow-sm hover:shadow transition"
                >
                  <span className="font-medium">{i + 1}. {user.name}</span>
                  <span className="text-[#8391a1]">{user.edits} edits</span>
                </div>
              )
            )}
          </div>
        </div>
      </section>

      <section className="max-w-3xl mx-auto py-16 text-center border-t border-[#d0d0cc]">
        <h2 className="text-2xl font-semibold mb-4">How It Works</h2>
        <p className="text-[#6b6b6b] max-w-xl mx-auto mb-8">
          [Placeholder text] — Contributors add, verify, and update knowledge
          about Dust. The community earns reputation and tokens for valuable
          submissions.
        </p>
        <a
          href="#"
          className="inline-block bg-[#8391a1] text-white px-6 py-3 rounded-lg shadow hover:bg-[#6f7c8b] transition"
        >
          Join the Dust Community
        </a>
      </section>
    </main>
  );
}