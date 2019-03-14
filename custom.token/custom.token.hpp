/**
 *  Author: Nirdesh Kumar
 *  erc-20 standard header file
 */
#pragma once

#include <eosiolib/asset.hpp>
#include <eosiolib/eosio.hpp>
#include <string>

namespace eosiosystem
{
class system_contract;
}

namespace eosio
{

using std::string;

class[[eosio::contract("custom.token")]] customtoken : public contract
{
  public:
    using contract::contract;

    [[eosio::action]] void create(name issuer,
                                  asset maximum_supply);

    [[eosio::action]] void issue(name to, asset quantity, string memo);

    [[eosio::action]] void retire(asset quantity, string memo);

    [[eosio::action]] void transfer(name from,
                                    name to,
                                    asset quantity,
                                    string memo);

    [[eosio::action]] void open(name owner, const symbol &symbol, name ram_payer);

    [[eosio::action]] void close(name owner, const symbol &symbol);
    [[eosio::action]] void burntoken(name owner, asset max_supply);
    [[eosio::action]] void seton(name owner, string value);
    [[eosio::action]] void setoff(name owner, string value);
    [[eosio::action]] void setinitial(name owner);

    static asset get_supply(name token_contract_account, symbol_code sym_code)
    {
        stats statstable(token_contract_account, sym_code.raw());
        const auto &st = statstable.get(sym_code.raw());
        return st.supply;
    }

    static asset get_balance(name token_contract_account, name owner, symbol_code sym_code)
    {
        accounts accountstable(token_contract_account, owner.value);
        const auto &ac = accountstable.get(sym_code.raw());
        return ac.balance;
    }

  private:
    struct [[eosio::table]] account
    {
        asset balance;

        uint64_t primary_key() const { return balance.symbol.code().raw(); }
    };

    struct [[eosio::table]] currency_stats
    {
        asset supply;
        asset max_supply;
        name issuer;

        uint64_t primary_key() const { return supply.symbol.code().raw(); }
    };

    struct [[eosio::table]] flag
    {
        name owner;
        uint64_t flag_a;
        uint64_t flag_b;
        uint64_t flag_c;

        uint64_t primary_key() const { return owner.value; }
    };

    typedef eosio::multi_index<"accounts"_n, account> accounts;
    typedef eosio::multi_index<"stat"_n, currency_stats> stats;
    typedef eosio::multi_index<"flagt"_n, flag> flagt;

    void sub_balance(name owner, asset value);
    void add_balance(name owner, asset value, name ram_payer);
};

} // namespace eosio

