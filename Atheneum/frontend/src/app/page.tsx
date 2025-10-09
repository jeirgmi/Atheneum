'use client'
import Link from 'next/link'

export default function Home() {
  return (
    <main className="min-h-screen max-w-4xl mx-auto p-6">
      <header className="flex items-center justify-between mb-8">
        <h1 className="text-3xl font-bold">Atheneum</h1>
        <p className="text-sm text-neutral-400">Community-built wiki for Dust</p>
      </header>

      <section className="space-y-6">
        <div className="p-6 rounded-xl bg-neutral-900/60">
          <h2 className="text-xl font-semibold">What is Atheneum?</h2>
          <p className="mt-2 text-neutral-300">
            Atheneum is a community-driven wiki where contributors add verified information about Dust.
            This frontend is a simple static UI for now — smart contract integration comes later.
          </p>
        </div>

        <div className="grid md:grid-cols-2 gap-6">
          <div className="p-6 rounded-xl bg-neutral-900/60">
            <h3 className="font-semibold">Contribute</h3>
            <p className="text-sm text-neutral-300 mt-2">Submit your articles and updates. Moderators review and publish.</p>
          </div>
          <div className="p-6 rounded-xl bg-neutral-900/60">
            <h3 className="font-semibold">Moderation</h3>
            <p className="text-sm text-neutral-300 mt-2">Moderators approve contributions on-chain (contract stubs present).</p>
          </div>
        </div>

        <div className="mt-6">
          <Link href="#" className="px-4 py-2 rounded-lg bg-white text-black">Get started</Link>
        </div>
      </section>
    </main>
  )
}
