<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;

class WalletApiController extends Controller
{
    public function index()
    {
        $user = Auth::user();

        $data = DB::table('wallets')
            ->where('user_id', $user->id)
            ->get();

        return response()->json([
            'status' => true,
            'message' => 'List wallet',
            'data' => $data
        ]);
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:100',
            'saldo_awal' => 'required|numeric',
        ]);

        $user = Auth::user();

        $id = DB::table('wallets')->insertGetId([
            'user_id' => $user->id,
            'name' => $request->name,
            'saldo_awal' => $request->saldo_awal,
            'saldo_terkini' => $request->saldo_awal,
            'keterangan' => $request->keterangan,
            'created_at' => now(),
            'updated_at' => now(),
        ]);

        $wallet = DB::table('wallets')->where('id', $id)->first();

        return response()->json([
            'status' => true,
            'message' => 'Wallet created',
            'data' => $wallet
        ]);
    }

    public function show(Request $request)
    {
        $user = Auth::user();

        $wallet = DB::table('wallets')
            ->where('user_id', $user->id)
            ->where('id', $request->id)
            ->first();

        if (!$wallet) {
            return response()->json(['status' => false, 'message' => 'Wallet not found'], 404);
        }

        return response()->json(['status' => true, 'data' => $wallet]);
    }

    public function update(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:100',
            'keterangan' => 'required|string',
            'saldo_awal' => 'required|numeric',
        ]);

        $user = Auth::user();

        $updated = DB::table('wallets')
            ->where('user_id', $user->id)
            ->where('id', $request->id)
            ->update([
                'name' => $request->name,
                'saldo_awal' => $request->saldo_awal,
                'keterangan' => $request->keterangan,
                'updated_at' => now()
            ]);

        if (!$updated) {
            return response()->json(['status' => false, 'message' => 'Wallet not found or not updated'], 404);
        }

        $wallet = DB::table('wallets')->where('id', $request->id)->first();

        return response()->json([
            'status' => true,
            'message' => 'Wallet updated',
            'data' => $wallet
        ]);
    }

    public function destroy(Request $request)
    {
        $user = Auth::user();

        $deleted = DB::table('wallets')
            ->where('user_id', $user->id)
            ->where('id', $request->id)
            ->delete();

        if (!$deleted) {
            return response()->json(['status' => false, 'message' => 'Wallet not found'], 404);
        }

        return response()->json(['status' => true, 'message' => 'Wallet deleted']);
    }
}
