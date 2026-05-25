# BitEver RPC Explorer (BEC)

> A lightweight, RPC-based blockchain database-free web explorer designed specifically for the **BitEver (BEC)** L1 educational network.

---

## 🌟 What is BitEver?

**BitEver (BEC)** is a Bitcoin L1 hard fork designed for **blockchain education and hands-on learning**. The network launched independently from Bitcoin block **#478,559** (forking at the same point as Bitcoin Cash, #478,558), maintaining the exact consensus logic, halving policy, and 21 Million issuance limit as mainnet Bitcoin, with only network magic bytes customized.

---

## 🔍 The Role of RPC Explorer in BitEver Ecosystem

While other explorers like **Esplora** and **Mempool.space** rely on heavy local indexers (building gigabytes of transaction databases over many hours), **BitEver RPC Explorer** is a lightweight, database-free alternative.

- **Direct Interface**: It communicates directly with the BitEver Node (`bitcoind`) daemon via native JSON-RPC queries.
- **Auditing Tool**: Enables students and developers to inspect raw RPC responses, blocks, unspent transaction outputs (UTXOs), block candidate headers, and raw transaction hexes on-the-fly.
- **Zero Heavy Indexing**: Instantly active upon connecting to a synced Node, requiring zero additional disk space for database mapping.

---

## 🛠️ Technology Stack

- **Backend**: Node.js & Express.js (serving JSON-RPC queries)
- **Frontend Template**: EJS (Embedded JavaScript templates)
- **Styling**: Bootstrap (custom dark-theme styles, tailored brand palette, custom favicon)
- **Deployment**: Docker & Docker Compose (for production isolation)

---

## 🚀 Build & Run Instructions

### Prerequisites
A synchronized BitEver Node (`bitcoind`) running locally or accessible via network, with RPC enabled.

### Method 1: Local Installation (Node.js)

1. **Install Node.js**: Ensure you have Node.js version 18 or 20 installed.
2. **Clone & Setup**:
   ```bash
   cd BitEver-RPCexplorer
   npm install
   ```
3. **Configure Environment Variables**:
   Copy `.env-sample` to `.env` and fill in your connection variables:
   ```bash
   cp .env-sample .env
   ```
   *Edit `.env` configurations:*
   ```env
   # BitEver daemon RPC configuration
   BTCEXP_BITCOIND_HOST=127.0.0.1
   BTCEXP_BITCOIND_PORT=8334
   BTCEXP_BITCOIND_USER=user
   BTCEXP_BITCOIND_PASS=pass
   
   # Server Port
   PORT=3002
   ```
4. **Start the Application**:
   ```bash
   npm start
   ```

### Method 2: Docker / Docker Compose Deployment (Recommended)

Quickly run the explorer alongside your nodes using the optimized docker configurations:

1. **Validate docker compose syntax**:
   ```bash
   docker compose config
   ```
2. **Launch Container**:
   ```bash
   docker compose up -d
   ```
   This loads the pre-configured backend proxy, serving the web interface on the configured port.

---

## ⚠️ Important Considerations / Caveats

- **UTXO / Address Query Limits**: Since this explorer queries `bitcoind` directly without a dedicated index database, it **cannot** trace the complete historical transaction list for standard addresses unless the address has active UTXOs or you have `-txindex=1` enabled on the daemon node.
- **RPC Credentials**: Ensure the RPC username, password, and port in your `.env` exactly match your `bitever.conf` configuration. The default RPC port for BitEver is `8334`.

---

## 🤝 Contribution & License

Original project code belongs to the open-source community. BitEver-RPCexplorer modifications are customized under the MIT License.
